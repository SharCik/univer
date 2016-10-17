var Personal = React.createClass({
  getInitialState: function() {
    return {semester: this.props.semester_default, 
            active_first: 1,
            marks: [],
            credits: [],
            diff_credits: [] };
  },
  componentDidMount: function() {
    this.getDataMarks();
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
        alert('Cannot get data from!');
      }
    })
  },
  addDataMarks: function(semester) {
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
        alert('Cannot get data from!');
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
        this.addDataMarks(result);
      };
    }.bind(this));
  },
  setHeadActive: function(number) {
    this.getDataMarks();
    this.setState({ active_first: number });
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
                              defaultValue = {'Семестр ' + this.state.semester.number.toString() + ' ('+ this.state.semester.period +')'}
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
                      <select className = 'form-control sem-select'
                              defaultValue = {'Семестр ' + this.state.semester.number.toString() + ' ('+ this.state.semester.period +')'}
                              onChange = {(e) => this.selectSemesterHandler(e)}> 
                        {semesters_list}
                      </select>
                    </div>
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