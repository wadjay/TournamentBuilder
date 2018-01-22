window.onload = function () {
    function TournamentBuilderVM(){
        var self = this;
        self.numOfPools = ko.observable();
        self.numOfTeams = ko.observable();
        self.numOfRounds = ko.observable();
        self.standardFormat = ko.observable(false);
        self.pools = ko.observableArray([]);
        self.selectedPool = ko.observable();
        self.selectedTeam = ko.observable();

        self.generateTournament = function (){
            self.selectedPool(null);
            data = {};

            data.numOfPools = self.numOfPools();
            data.numOfTeams = self.numOfTeams();
            data.numOfRounds = self.numOfRounds();
            data.standardFormat = self.standardFormat();

            jQuery.ajax({
                url: '/tournaments',
                type: 'POST',
                data: data
            }).done(function(data){
                if(!!data) {
                    self.pools(data);
                } else {
                    alert("Your parameters generated no data!");
                }
            })
        };

        self.showPool = function(pool) {
            self.selectedPool(pool);
        };

        self.highlightGame = function(game) {
            return game.teams.some(function(team){
                return team == self.selectedTeam();
            })
        };
    }

    ko.applyBindings(new TournamentBuilderVM());
}
