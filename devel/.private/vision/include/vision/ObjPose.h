// Generated by gencpp from file vision/ObjPose.msg
// DO NOT EDIT!


#ifndef VISION_MESSAGE_OBJPOSE_H
#define VISION_MESSAGE_OBJPOSE_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace vision
{
template <class ContainerAllocator>
struct ObjPose_
{
  typedef ObjPose_<ContainerAllocator> Type;

  ObjPose_()
    : name()
    , center()
    , axis()  {
    }
  ObjPose_(const ContainerAllocator& _alloc)
    : name(_alloc)
    , center(_alloc)
    , axis(_alloc)  {
  (void)_alloc;
    }



   typedef std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>> _name_type;
  _name_type name;

   typedef std::vector<float, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<float>> _center_type;
  _center_type center;

   typedef std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>> _axis_type;
  _axis_type axis;





  typedef boost::shared_ptr< ::vision::ObjPose_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::vision::ObjPose_<ContainerAllocator> const> ConstPtr;

}; // struct ObjPose_

typedef ::vision::ObjPose_<std::allocator<void> > ObjPose;

typedef boost::shared_ptr< ::vision::ObjPose > ObjPosePtr;
typedef boost::shared_ptr< ::vision::ObjPose const> ObjPoseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::vision::ObjPose_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::vision::ObjPose_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::vision::ObjPose_<ContainerAllocator1> & lhs, const ::vision::ObjPose_<ContainerAllocator2> & rhs)
{
  return lhs.name == rhs.name &&
    lhs.center == rhs.center &&
    lhs.axis == rhs.axis;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::vision::ObjPose_<ContainerAllocator1> & lhs, const ::vision::ObjPose_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace vision

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::vision::ObjPose_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::vision::ObjPose_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::vision::ObjPose_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::vision::ObjPose_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::vision::ObjPose_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::vision::ObjPose_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::vision::ObjPose_<ContainerAllocator> >
{
  static const char* value()
  {
    return "72e29f00dd64422822163c74c4f43cc0";
  }

  static const char* value(const ::vision::ObjPose_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x72e29f00dd644228ULL;
  static const uint64_t static_value2 = 0x22163c74c4f43cc0ULL;
};

template<class ContainerAllocator>
struct DataType< ::vision::ObjPose_<ContainerAllocator> >
{
  static const char* value()
  {
    return "vision/ObjPose";
  }

  static const char* value(const ::vision::ObjPose_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::vision::ObjPose_<ContainerAllocator> >
{
  static const char* value()
  {
    return "string name\n"
"float32[] center\n"
"string axis\n"
;
  }

  static const char* value(const ::vision::ObjPose_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::vision::ObjPose_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.name);
      stream.next(m.center);
      stream.next(m.axis);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct ObjPose_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::vision::ObjPose_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::vision::ObjPose_<ContainerAllocator>& v)
  {
    s << indent << "name: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>>>::stream(s, indent + "  ", v.name);
    s << indent << "center[]" << std::endl;
    for (size_t i = 0; i < v.center.size(); ++i)
    {
      s << indent << "  center[" << i << "]: ";
      Printer<float>::stream(s, indent + "  ", v.center[i]);
    }
    s << indent << "axis: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>>>::stream(s, indent + "  ", v.axis);
  }
};

} // namespace message_operations
} // namespace ros

#endif // VISION_MESSAGE_OBJPOSE_H
