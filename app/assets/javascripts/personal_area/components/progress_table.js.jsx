var ProgressTable = React.createClass({
  render: function() {
    var marks        = [],
        credits      = [],
        diff_credits = [];
    this.props.marks.forEach(function(mark) {
      marks.push(<Mark mark={mark} key={'mark' + mark.id} progressActive={this.props.progressActive}/>);
    }.bind(this));
    this.props.credits.forEach(function(credit) {
      credits.push(<Credit credit={credit} key={'credit' + credit.id} progressActive={this.props.progressActive}/>);
    }.bind(this));
    this.props.diff_credits.forEach(function(diff_credit) {
      diff_credits.push(<DiffCredit diff_credit={diff_credit} key={'diff_credit' + diff_credit.id} progressActive={this.props.progressActive}/>);
    }.bind(this));
    return (
      <table className="table table-striped">
        <thead className='table-head'>
          <tr className='tr-up'>
            <th className="col-xs-5 progress-tr">Предмет</th>
            <th className="col-xs-3 progress-tr">Оценка</th>
            <th className="col-xs-4 progress-tr">Дата</th>
          </tr>
        </thead>
        <tbody>
          {marks}
          {credits}
          {diff_credits}
        </tbody>
      </table>
    )
  }
});

var Mark = React.createClass({
  render: function() {
    var mark = this.props.mark;
    return(
      <tr className={(this.props.progressActive == 1 ? '' : 'hide') + (this.props.mark.value >= 4 ? ' good-progress' : ' bad-progress')}>
        <td className='progress-tr'>{mark.subject}</td>
        <td className='progress-tr'>{mark.value}</td>
        <td className='progress-tr'>{mark.data}</td>
      </tr>
    )
  }
});

var Credit = React.createClass({
  render: function() {
    var credit = this.props.credit;
    return(
      <tr className={(this.props.progressActive == 2 ? '' : 'hide') + (this.props.credit.value == true ? ' good-progress' : ' bad-progress')}>
        <td className='progress-tr'>{credit.subject}</td>
        <td className='progress-tr'>{credit.value == true ? 'Зачтено' : 'Не зачет'}</td>
        <td className='progress-tr'>{credit.data}</td>
      </tr>
    )
  }
});

var DiffCredit = React.createClass({
  render: function() {
    var diff_credit = this.props.diff_credit;
    return(
      <tr className={(this.props.progressActive == 3 ? '' : 'hide') + (this.props.diff_credit.value >= 4 ? ' good-progress' : ' bad-progress')}>
        <td className='progress-tr'>{diff_credit.subject}</td>
        <td className='progress-tr'>{diff_credit.value}</td>
        <td className='progress-tr'>{diff_credit.data}</td>
      </tr>
    )
  }
});