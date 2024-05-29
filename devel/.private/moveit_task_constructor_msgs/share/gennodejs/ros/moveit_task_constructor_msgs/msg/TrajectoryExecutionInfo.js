// Auto-generated. Do not edit!

// (in-package moveit_task_constructor_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class TrajectoryExecutionInfo {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.controller_names = null;
    }
    else {
      if (initObj.hasOwnProperty('controller_names')) {
        this.controller_names = initObj.controller_names
      }
      else {
        this.controller_names = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type TrajectoryExecutionInfo
    // Serialize message field [controller_names]
    bufferOffset = _arraySerializer.string(obj.controller_names, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type TrajectoryExecutionInfo
    let len;
    let data = new TrajectoryExecutionInfo(null);
    // Deserialize message field [controller_names]
    data.controller_names = _arrayDeserializer.string(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    object.controller_names.forEach((val) => {
      length += 4 + _getByteLength(val);
    });
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'moveit_task_constructor_msgs/TrajectoryExecutionInfo';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'e1a83c75a8827f8b45cef6766d0a9ba3';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # List of controllers to use when executing the trajectory
    string[] controller_names
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new TrajectoryExecutionInfo(null);
    if (msg.controller_names !== undefined) {
      resolved.controller_names = msg.controller_names;
    }
    else {
      resolved.controller_names = []
    }

    return resolved;
    }
};

module.exports = TrajectoryExecutionInfo;
