var Personal = React.createClass({
  getInitialState: function() {
    return {semester: this.props.semesters[(this.props.semesters.length - 1)], 
            active_first: 1 };
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
      };
    });
    this.setState({ semester: result });
  },
  setHeadActive: function(number) {
    this.setState({ active_first: number });
  },
  render: function()  {
      var semesters = this.props.semesters,
          default_semester = this.state.semester,
          semesters_list = [];
      this.props.semesters.forEach(function(semester) {
        semesters_list.push(<SemesterOption semester={semester} active = {default_semester.id} key={'semester' + semester.id}/>);
      }.bind(this));
      return  (
          <div  className='container-fluid back'>
              <div  className='container-fluid white-line'></div>
              <div  className='container-fluid pink-line'>
                <div className='text-center username'>{this.props.student.username}</div>
              </div>
              <div  className='container-fluid info-cont'>
                  <div className='col-xs-4 text-center'>
                    <img src={this.props.student.avatar.url} alt="avatar" className='img-circle'/>
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
                  <div className='col-xs-4'></div>
                  <div className='col-xs-8'>
                    <div className='col-xs-3 circ'>
                      <div className='circle'>{this.props.student.rating}</div>
                      <div className='text-center text-circle'>Текущий рейтинг</div>
                    </div>
                    <div className='col-xs-3 text-center'>
                      <div className='circle'>{this.props.omis}</div>
                      <div className='text-center text-circle'>Пропуски <br/>(последний семестр)</div>
                    </div>
                    <div className='col-xs-3 text-center'>
                      <div className='circle'>{this.props.penal}</div>
                      <div className='text-center text-circle'>Выговоры и <br/>штрафы</div>
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
                      <select className = 'form-control sem-select'
                              defaultValue = {'Семестр ' + default_semester.number.toString() + ' ('+ default_semester.period +')'}
                              onChange = {(e) => this.selectSemesterHandler(e)}> 
                        {semesters_list}
                      </select>
                    </div>
                    <div className={'col-xs-3 first-head ' + (this.state.active_first == 1 ? 'active-head' : '')}
                         onClick={() => { this.setHeadActive(1)}}>
                         Оценка за экзамен
                         </div>
                    <div className={'col-xs-4 first-head ' + (this.state.active_first == 2 ? 'active-head' : '')}
                         onClick={() => { this.setHeadActive(2)}}>
                         Дифференцированный зачет
                         </div>
                    <div className={'col-xs-5 first-head ' + (this.state.active_first == 3 ? 'active-head' : '')}
                         onClick={() => { this.setHeadActive(3)}}>
                         Не дифф. зачет
                         </div>
                  </div>
                </div>
            </div>
        )
    }
});







var SemesterOption = React.createClass({
  activeSemester: function(semester) {
    if (semester.id == this.props.active){ 
      return 'selected';
    }else{
      return 'disabled';
    };
  },
  render: function() {
    var semester = this.props.semester;
    return(
      <option value={semester.id} selected={this.activeSemester(semester)}>{'Семестр ' + semester.number.toString() + ' ('+ semester.period +')'}</option>
    )
  }
});