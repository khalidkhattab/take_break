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