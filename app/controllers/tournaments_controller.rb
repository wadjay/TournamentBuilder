class Pool
    attr_accessor :name, :teams, :games
	def initialize (num)
		@name = "Pool " + baseAZ(num)
		@teams = []
		@games = []
    end

    #Full disclosure - I lifted this baseAZ function from stack overflow rather than inventing my own
    def baseAZ(num)
        # temp variable for converting base
        temp = num

        # the base 26 (az) number
        az = ''

        while temp > 0

            # get the remainder and convert to a letter
            num26 = temp % 26
            temp /= 26

            # offset for lack of "0"
            temp -= 1 if num26 == 0

            az = (num26).to_s(26).tr('0-9a-p', 'ZA-Y') + az
        end

        return az
    end
end

class Game
	def initialize (team1, team2)
		@id = SecureRandom.uuid
		@teams = [team1, team2]
	end
end

class TournamentsController < ApplicationController
    def create
        numOfPools = params[:numOfPools].to_i
        numOfTeams = params[:numOfTeams].to_i
        numOfRounds = params[:numOfRounds].to_i
        standardFormat = params[:standardFormat] || 'false'
        
        pools = []
        poolIndex = 0;
        reverse = false;
        
        (1..numOfPools).each do |index|
            pools.push(Pool.new(index))
        end

        #Establish Pools
        (1..numOfTeams).each do |teamNum|
            pools[poolIndex].teams.push("Team #" + teamNum.to_s)
             if !reverse
                 if poolIndex == (numOfPools - 1)
                     standardFormat == 'false' ? reverse = true : poolIndex = 0
                 else
                     poolIndex = poolIndex + 1
                 end
             else 
                 if poolIndex == 0
                     reverse = false
                 else 
                     poolIndex = poolIndex - 1
                end
            end
        end

        #Establish Rounds
        (1..numOfRounds).each do
            for pool in pools
                lastIndex = pool.teams.length - 1
                (0..lastIndex).each do |team|
                    opponent = team + 1;
                    while opponent < pool.teams.length
                        pool.games.push(Game.new(pool.teams[team], pool.teams[opponent]))
                        opponent = opponent + 1
                    end
                end
            end
        end
        render json: pools
    end
end
