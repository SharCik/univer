var Personal = React.createClass({
  getInitialState: function() {
    return {semester: this.props.semester_default,
            semester_penalties: this.props.semester_default, 
            active_first: 1,
            active_second: 1,
            marks: [],
            credits: [],
            diff_credits: [],
            months: [],
            omissions: [],
            penalties: [] };
  },
  componentDidMount: function() {
    this.getDataMarks();
    this.getDataPenalties();
  },
  getDataMarks: function() {
    var self = this,
        sem  = self.state.semester.id;
    $.ajax({
      url: '/semester_info',
      method: 'POST',
      data: { semester: sem },
      success: function(data) {
        self.setState({ marks: data.marks,
                        credits: data.credits,
                        diff_credits: data.diff_credits });
      },
      error: function(xhr,status,error){
      }
    })
  },
  updateDataMarks: function(semester) {
    var self = this,
        sem  = semester.id;
    $.ajax({
      url: '/semester_info',
      method: 'POST',
      data: { semester: sem },
      success: function(data) {
        self.setState({ marks: data.marks,
                        credits: data.credits,
                        diff_credits: data.diff_credits });
      },
      error: function(xhr,status,error){
      }
    })
  },
  getDataPenalties: function() {
    var self = this,
        sem  = self.state.semester_penalties.id;
    $.ajax({
      url: '/semester_penalties',
      method: 'POST',
      data: { semester: sem },
      success: function(data) {
        self.setState({ months: data.months,
                        omissions: data.omissions,
                        penalties: data.penalties });
      },
      error: function(xhr,status,error){
      }
    })
  },
  updateDataPenalties: function(semester) {
    var self = this,
        sem  = semester.id;
    $.ajax({
      url: '/semester_penalties',
      method: 'POST',
      data: { semester: sem },
      success: function(data) {
        self.setState({ months: data.months,
                        omissions: data.omissions,
                        penalties: data.penalties });
      },
      error: function(xhr,status,error){
      }
    })
  },
  haveHostel: function() {
    if (this.props.student.hostel == true){
      return 'Есть';
    } else {
      return 'Нет';
    };
  },
  selectSemesterHandler: function(event) {
    var semesterId = event.target.value;
    var result;
    this.props.semesters.forEach(function(x) {
      if (x.id == semesterId){
        result = x;
        this.setState({ semester: result });
        this.updateDataMarks(result);
      };
    }.bind(this));
  },
  selectSemesterSecondHandler: function(event) {
    var semesterId = event.target.value;
    var result;
    this.props.semesters.forEach(function(x) {
      if (x.id == semesterId){
        result = x;
        this.setState({ semester_penalties: result });
        this.updateDataPenalties(result);
      };
    }.bind(this));
  },
  setHeadFirstActive: function(number) {
    this.getDataMarks();
    this.setState({ active_first: number });
  },
  setHeadSecondActive: function(number) {
    this.getDataPenalties();
    this.setState({ active_second: number });
  },
  render: function()  {
      var semesters = this.props.semesters,
          semesters_list = [];
      this.props.semesters.forEach(function(semester) {
        semesters_list.push(<SemesterOption semester={semester} key={'semester' + semester.id}/>);
      }.bind(this));
      return  (
          <div  className='container-fluid back'>
              <div  className='container-fluid white-line'></div>
              <div  className='container-fluid pink-line'>
                <div className='text-center username'>{this.props.student.username}</div>
              </div>
              <div  className='container-fluid info-cont'>
                  <div className='col-xs-4 text-center'>
                    <img src={this.props.student.avatar.ava.url} alt="avatar" className='img-circle'/>
                  </div>
                  <div className='col-xs-8'>
                    <table>
                      <tbody>
                        <tr>
                          <td className='info-first full-info'>ФИО</td>
                          <td className='info-second full-info'>{this.props.student.full_name}</td>
                        </tr>
                        <tr>
                          <td className='info-first full-info'>Страна</td>
                          <td className='info-second full-info'>{this.props.student.country}</td>
                        </tr>
                        <tr>
                          <td className='info-first full-info'>Дата рождения</td>
                          <td className='info-second full-info'>{this.props.student.birthday}</td>
                        </tr>
                        <tr>
                          <td className='info-first full-info'>Университет</td>
                          <td className='info-second full-info'>{this.props.univer.name + ' ('+this.props.univer.short_name+')'}</td>
                        </tr>
                        <tr>
                          <td className='info-first full-info'>Факультет</td>
                          <td className='info-second full-info'>{this.props.departament.name}</td>
                        </tr>
                        <tr>
                            <td className='info-first full-info'>Специальность</td>
                            <td className='info-second full-info'>{this.props.specialty.name}</td>
                        </tr>
                        <tr>
                            <td className='info-first full-info'>Наличие общежития</td>
                            <td className='info-second full-info'>{this.haveHostel()}</td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                  <div className='col-xs-8 col-xs-offset-4'>
                    <div className='col-xs-3 circ'>
                      <div className='circle'>{this.props.student.rating.length != 0 ? this.props.student.rating : '0'}</div>
                      <div className='text-center text-circle'>Текущий рейтинг</div>
                    </div>
                    <div className='col-xs-3 text-center'>
                      <div className='circle'>{this.props.omis.length != 0 ? this.props.omis : '0'}</div>
                      <div className='text-center text-circle'>Пропуски <br/>(последний семестр)</div>
                    </div>
                    <div className='col-xs-3 text-center'>
                      <div className='circle'>{this.props.penal.length != 0 ? this.props.penal : '0'}</div>
                      <div className='text-center text-circle'>Выговоры и штрафы<br/>(последний семестр)</div>
                    </div>
                  </div>
                </div>
                <div className='container-fluid marks-cont'>
                  <table className='hr-text'>
                    <td><hr className='half-hr' /></td>
                    <td className='text-hr'>УСПЕВАЕМОСТЬ</td>
                    <td><hr className='half-hr' /></td>
                  </table>
                  <div className='container cont-tabl'>
                    <div className='form-inline select-cont'>
                      <label className='semester-label'>Выберите семестр</label>
                      <select onChange = {(e) => this.selectSemesterHandler(e)}
                              className = 'form-control sem-select'
                              value = {this.state.semester.id}>
                        {semesters_list}
                      </select>
                    </div>
                    <div className={'col-xs-3 first-head ' + (this.state.active_first == 1 ? 'active-head' : '')}
                         onClick={() => { this.setHeadFirstActive(1)}}>
                         Оценка за экзамен
                         </div>
                    <div className={'col-xs-4 first-head ' + (this.state.active_first == 2 ? 'active-head' : '')}
                         onClick={() => { this.setHeadFirstActive(2)}}>
                         Не дифф. зачет
                         </div>
                    <div className={'col-xs-5 first-head ' + (this.state.active_first == 3 ? 'active-head' : '')}
                         onClick={() => { this.setHeadFirstActive(3)}}>
                         Дифференцированный зачет
                         </div>
                    <ProgressTable marks={this.state.marks} credits={this.state.credits} diff_credits={this.state.diff_credits} progressActive={this.state.active_first} />
                  </div>
                <div className='container-fluid marks-cont'>
                  <table className='hr-text'>
                    <td><hr className='half-hr' /></td>
                    <td className='text-hr'>ПРОПУСКИ И ВЫГОВОРЫ</td>
                    <td><hr className='half-hr' /></td>
                  </table>
                  <div className='container cont-tabl'>
                    <div className='form-inline select-cont'>
                      <label className='semester-label'>Выберите семестр</label>
                      <select onChange = {(e) => this.selectSemesterSecondHandler(e)}
                              className = 'form-control sem-select'
                              value = {this.state.semester_penalties.id}> 
                        {semesters_list}
                      </select>
                    </div>
                    <div className={'col-xs-3 first-head ' + (this.state.active_second == 1 ? 'active-head' : '')}
                         onClick={() => { this.setHeadSecondActive(1)}}>
                         Пропуски
                         </div>
                    <div className={'col-xs-9 first-head ' + (this.state.active_second == 2 ? 'active-head' : '')}
                         onClick={() => { this.setHeadSecondActive(2)}}>
                         Выговоры и замечания
                         </div>
                    <FailTable months={this.state.months} omissions={this.state.omissions} penalties={this.state.penalties} failActive={this.state.active_second} />
                  </div>
                </div>
                </div>
            </div>
        )
    }
});







var SemesterOption = React.createClass({
  render: function() {
    var semester = this.props.semester;
    return(
      <option value={semester.id}>{'Семестр ' + semester.number.toString() + ' ('+ semester.period +')'}</option>
    )
  }
});