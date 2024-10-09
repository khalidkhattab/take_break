abstract class TakeBreakStatus{}
class TakeBreakInitStatus extends TakeBreakStatus{}




class GetTeacherDataLoadingState extends TakeBreakStatus{}
class GetTeacherDataSuccessState extends TakeBreakStatus{}
class GetTeacherDataErrorState extends TakeBreakStatus{}


class GetCurrentEmployeeDataLoadingState extends TakeBreakStatus{}
class GetCurrentEmployeeDataSuccessState extends TakeBreakStatus{}
class GetCurrentEmployeeDataErrorState extends TakeBreakStatus{}




class AddTeacherDataLoadingState extends TakeBreakStatus{}
class AddTeacherDataSuccessState extends TakeBreakStatus{}
class AddTeacherDataErrorState extends TakeBreakStatus{}


class DeleteTeacherDataLoadingState extends TakeBreakStatus{}
class DeleteTeacherDataSuccessState extends TakeBreakStatus{}
class DeleteTeacherDataErrorState extends TakeBreakStatus{}

class AddTeacherBreakLoadingState extends TakeBreakStatus{}
class AddTeacherBreakSuccessState extends TakeBreakStatus{}
class AddTeacherBreakErrorState extends TakeBreakStatus{}



class GetTeacherBreakLoadingState extends TakeBreakStatus{}
class GetTeacherBreakSuccessState extends TakeBreakStatus{}
class GetTeacherBreakErrorState extends TakeBreakStatus{}

//only for test
class RefreshState extends TakeBreakStatus{}


class DeleteTeacherBreakLoadingState extends TakeBreakStatus{}
class DeleteTeacherBreakSuccessState extends TakeBreakStatus{}
class DeleteTeacherBreakErrorState extends TakeBreakStatus{}


class GetDepartmentDataLoadingState extends TakeBreakStatus{}
class GetDepartmentDataSuccessState extends TakeBreakStatus{}
class GetDepartmentDataErrorState extends TakeBreakStatus{}


class GetDepTeacherDataLoadingState extends TakeBreakStatus{}
class GetDepTeacherDataSuccessState extends TakeBreakStatus{}
class GetDepTeacherDataErrorState extends TakeBreakStatus{}