var FailTable = React.createClass({
  selectHead: function() {
    if (this.props.failActive == 1) {
      return (<HeadOmis />)
    } else {
      return (<HeadPenalties />)
    };
  },
  render: function() {
    var omissions        = [],
        penalties      = [];
    this.props.omissions.forEach(function(omission) {
      omissions.push(<Omission omission={omission} months={this.props.months} key={'omission' + omission.id} failActive={this.props.failActive}/>);
    }.bind(this));
    this.props.penalties.forEach(function(penalty) {
      penalties.push(<Penalty penalty={penalty} key={'penalty' + penalty.id} failActive={this.props.failActive}/>);
    }.bind(this));
    return (
      <table className="table table-striped">
        <thead className='table-head'>
          {this.selectHead()}
        </thead>
        <tbody>
          {omissions}
          {penalties}
        </tbody>
      </table>
    )
  }
});

var Omission = React.createClass({
  getMonth: function(month_id) {
    var result;
    this.props.months.forEach(function(month) {
      if (month.id == month_id) { result = month };
    }.bind(this));
    return result.name;
  },
  render: function() {
    var omission = this.props.omission,
        months = this.props.months;
    return(
      <tr className={(this.props.failActive == 1 ? '' : 'hide') + ' good-progress tr-up'}>
        <td className='progress-tr'>{this.getMonth(omission.month_id)}</td>
        <td className='progress-tr'>{omission.hours}</td>
      </tr>
    )
  }
});

var Penalty = React.createClass({
  render: function() {
    var penalty = this.props.penalty;
    return(
      <tr className={(this.props.failActive == 2 ? '' : 'hide') + ' good-progress tr-up'}>
        <td className='progress-tr'>{penalty.title}</td>
        <td className='progress-tr'>{penalty.data}</td>
      </tr>
    )
  }
});

var HeadOmis = React.createClass({
  render: function() {
    return(
      <tr className='tr-up'>
        <th className="col-xs-6 progress-tr">Месяц</th>
        <th className="col-xs-6 progress-tr">Число пропущенных часов</th>
      </tr>
    )
  }
});

var HeadPenalties = React.createClass({
  render: function() {
    return(
      <tr className='tr-up'>
        <th className="col-xs-8 col-md-9 progress-tr">Описание выговора</th>
        <th className="col-xs-4 col-md-3 progress-tr">Дата</th>
      </tr>
    )
  }
});
