package cn.itcast.dao.system;



import cn.itcast.domain.system.FeedBack;
import cn.itcast.domain.system.FeedBackExample;

import java.util.List;

public interface FeedBackDao {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table pe_feedback
     *
     * @mbg.generated
     */
    int deleteByPrimaryKey(String feedbackId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table pe_feedback
     *
     * @mbg.generated
     */
    int insert(FeedBack record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table pe_feedback
     *
     * @mbg.generated
     */
    int insertSelective(FeedBack record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table pe_feedback
     *
     * @mbg.generated
     */
    List<FeedBack> selectByExample(FeedBackExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table pe_feedback
     *
     * @mbg.generated
     */
    FeedBack selectByPrimaryKey(String feedbackId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table pe_feedback
     *
     * @mbg.generated
     */
    int updateByPrimaryKeySelective(FeedBack record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table pe_feedback
     *
     * @mbg.generated
     */
    int updateByPrimaryKey(FeedBack record);
}