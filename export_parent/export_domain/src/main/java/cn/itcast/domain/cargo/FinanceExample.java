package cn.itcast.domain.cargo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class FinanceExample implements Serializable {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table co_finance
     *
     * @mbg.generated
     */
    protected String orderByClause;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table co_finance
     *
     * @mbg.generated
     */
    protected boolean distinct;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table co_finance
     *
     * @mbg.generated
     */
    protected List<Criteria> oredCriteria;

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table co_finance
     *
     * @mbg.generated
     */
    public FinanceExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table co_finance
     *
     * @mbg.generated
     */
    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table co_finance
     *
     * @mbg.generated
     */
    public String getOrderByClause() {
        return orderByClause;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table co_finance
     *
     * @mbg.generated
     */
    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table co_finance
     *
     * @mbg.generated
     */
    public boolean isDistinct() {
        return distinct;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table co_finance
     *
     * @mbg.generated
     */
    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table co_finance
     *
     * @mbg.generated
     */
    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table co_finance
     *
     * @mbg.generated
     */
    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table co_finance
     *
     * @mbg.generated
     */
    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table co_finance
     *
     * @mbg.generated
     */
    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table co_finance
     *
     * @mbg.generated
     */
    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    /**
     * This class was generated by MyBatis Generator.
     * This class corresponds to the database table co_finance
     *
     * @mbg.generated
     */
    protected abstract static class GeneratedCriteria implements Serializable {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andFinanceIdIsNull() {
            addCriterion("FINANCE_ID is null");
            return (Criteria) this;
        }

        public Criteria andFinanceIdIsNotNull() {
            addCriterion("FINANCE_ID is not null");
            return (Criteria) this;
        }

        public Criteria andFinanceIdEqualTo(String value) {
            addCriterion("FINANCE_ID =", value, "financeId");
            return (Criteria) this;
        }

        public Criteria andFinanceIdNotEqualTo(String value) {
            addCriterion("FINANCE_ID <>", value, "financeId");
            return (Criteria) this;
        }

        public Criteria andFinanceIdGreaterThan(String value) {
            addCriterion("FINANCE_ID >", value, "financeId");
            return (Criteria) this;
        }

        public Criteria andFinanceIdGreaterThanOrEqualTo(String value) {
            addCriterion("FINANCE_ID >=", value, "financeId");
            return (Criteria) this;
        }

        public Criteria andFinanceIdLessThan(String value) {
            addCriterion("FINANCE_ID <", value, "financeId");
            return (Criteria) this;
        }

        public Criteria andFinanceIdLessThanOrEqualTo(String value) {
            addCriterion("FINANCE_ID <=", value, "financeId");
            return (Criteria) this;
        }

        public Criteria andFinanceIdLike(String value) {
            addCriterion("FINANCE_ID like", value, "financeId");
            return (Criteria) this;
        }

        public Criteria andFinanceIdNotLike(String value) {
            addCriterion("FINANCE_ID not like", value, "financeId");
            return (Criteria) this;
        }

        public Criteria andFinanceIdIn(List<String> values) {
            addCriterion("FINANCE_ID in", values, "financeId");
            return (Criteria) this;
        }

        public Criteria andFinanceIdNotIn(List<String> values) {
            addCriterion("FINANCE_ID not in", values, "financeId");
            return (Criteria) this;
        }

        public Criteria andFinanceIdBetween(String value1, String value2) {
            addCriterion("FINANCE_ID between", value1, value2, "financeId");
            return (Criteria) this;
        }

        public Criteria andFinanceIdNotBetween(String value1, String value2) {
            addCriterion("FINANCE_ID not between", value1, value2, "financeId");
            return (Criteria) this;
        }

        public Criteria andInputDateIsNull() {
            addCriterion("INPUT_DATE is null");
            return (Criteria) this;
        }

        public Criteria andInputDateIsNotNull() {
            addCriterion("INPUT_DATE is not null");
            return (Criteria) this;
        }

        public Criteria andInputDateEqualTo(Date value) {
            addCriterion("INPUT_DATE =", value, "inputDate");
            return (Criteria) this;
        }

        public Criteria andInputDateNotEqualTo(Date value) {
            addCriterion("INPUT_DATE <>", value, "inputDate");
            return (Criteria) this;
        }

        public Criteria andInputDateGreaterThan(Date value) {
            addCriterion("INPUT_DATE >", value, "inputDate");
            return (Criteria) this;
        }

        public Criteria andInputDateGreaterThanOrEqualTo(Date value) {
            addCriterion("INPUT_DATE >=", value, "inputDate");
            return (Criteria) this;
        }

        public Criteria andInputDateLessThan(Date value) {
            addCriterion("INPUT_DATE <", value, "inputDate");
            return (Criteria) this;
        }

        public Criteria andInputDateLessThanOrEqualTo(Date value) {
            addCriterion("INPUT_DATE <=", value, "inputDate");
            return (Criteria) this;
        }

        public Criteria andInputDateIn(List<Date> values) {
            addCriterion("INPUT_DATE in", values, "inputDate");
            return (Criteria) this;
        }

        public Criteria andInputDateNotIn(List<Date> values) {
            addCriterion("INPUT_DATE not in", values, "inputDate");
            return (Criteria) this;
        }

        public Criteria andInputDateBetween(Date value1, Date value2) {
            addCriterion("INPUT_DATE between", value1, value2, "inputDate");
            return (Criteria) this;
        }

        public Criteria andInputDateNotBetween(Date value1, Date value2) {
            addCriterion("INPUT_DATE not between", value1, value2, "inputDate");
            return (Criteria) this;
        }

        public Criteria andInputByIsNull() {
            addCriterion("INPUT_BY is null");
            return (Criteria) this;
        }

        public Criteria andInputByIsNotNull() {
            addCriterion("INPUT_BY is not null");
            return (Criteria) this;
        }

        public Criteria andInputByEqualTo(String value) {
            addCriterion("INPUT_BY =", value, "inputBy");
            return (Criteria) this;
        }

        public Criteria andInputByNotEqualTo(String value) {
            addCriterion("INPUT_BY <>", value, "inputBy");
            return (Criteria) this;
        }

        public Criteria andInputByGreaterThan(String value) {
            addCriterion("INPUT_BY >", value, "inputBy");
            return (Criteria) this;
        }

        public Criteria andInputByGreaterThanOrEqualTo(String value) {
            addCriterion("INPUT_BY >=", value, "inputBy");
            return (Criteria) this;
        }

        public Criteria andInputByLessThan(String value) {
            addCriterion("INPUT_BY <", value, "inputBy");
            return (Criteria) this;
        }

        public Criteria andInputByLessThanOrEqualTo(String value) {
            addCriterion("INPUT_BY <=", value, "inputBy");
            return (Criteria) this;
        }

        public Criteria andInputByLike(String value) {
            addCriterion("INPUT_BY like", value, "inputBy");
            return (Criteria) this;
        }

        public Criteria andInputByNotLike(String value) {
            addCriterion("INPUT_BY not like", value, "inputBy");
            return (Criteria) this;
        }

        public Criteria andInputByIn(List<String> values) {
            addCriterion("INPUT_BY in", values, "inputBy");
            return (Criteria) this;
        }

        public Criteria andInputByNotIn(List<String> values) {
            addCriterion("INPUT_BY not in", values, "inputBy");
            return (Criteria) this;
        }

        public Criteria andInputByBetween(String value1, String value2) {
            addCriterion("INPUT_BY between", value1, value2, "inputBy");
            return (Criteria) this;
        }

        public Criteria andInputByNotBetween(String value1, String value2) {
            addCriterion("INPUT_BY not between", value1, value2, "inputBy");
            return (Criteria) this;
        }

        public Criteria andStateIsNull() {
            addCriterion("STATE is null");
            return (Criteria) this;
        }

        public Criteria andStateIsNotNull() {
            addCriterion("STATE is not null");
            return (Criteria) this;
        }

        public Criteria andStateEqualTo(Integer value) {
            addCriterion("STATE =", value, "state");
            return (Criteria) this;
        }

        public Criteria andStateNotEqualTo(Integer value) {
            addCriterion("STATE <>", value, "state");
            return (Criteria) this;
        }

        public Criteria andStateGreaterThan(Integer value) {
            addCriterion("STATE >", value, "state");
            return (Criteria) this;
        }

        public Criteria andStateGreaterThanOrEqualTo(Integer value) {
            addCriterion("STATE >=", value, "state");
            return (Criteria) this;
        }

        public Criteria andStateLessThan(Integer value) {
            addCriterion("STATE <", value, "state");
            return (Criteria) this;
        }

        public Criteria andStateLessThanOrEqualTo(Integer value) {
            addCriterion("STATE <=", value, "state");
            return (Criteria) this;
        }

        public Criteria andStateIn(List<Integer> values) {
            addCriterion("STATE in", values, "state");
            return (Criteria) this;
        }

        public Criteria andStateNotIn(List<Integer> values) {
            addCriterion("STATE not in", values, "state");
            return (Criteria) this;
        }

        public Criteria andStateBetween(Integer value1, Integer value2) {
            addCriterion("STATE between", value1, value2, "state");
            return (Criteria) this;
        }

        public Criteria andStateNotBetween(Integer value1, Integer value2) {
            addCriterion("STATE not between", value1, value2, "state");
            return (Criteria) this;
        }

        public Criteria andCreateByIsNull() {
            addCriterion("CREATE_BY is null");
            return (Criteria) this;
        }

        public Criteria andCreateByIsNotNull() {
            addCriterion("CREATE_BY is not null");
            return (Criteria) this;
        }

        public Criteria andCreateByEqualTo(String value) {
            addCriterion("CREATE_BY =", value, "createBy");
            return (Criteria) this;
        }

        public Criteria andCreateByNotEqualTo(String value) {
            addCriterion("CREATE_BY <>", value, "createBy");
            return (Criteria) this;
        }

        public Criteria andCreateByGreaterThan(String value) {
            addCriterion("CREATE_BY >", value, "createBy");
            return (Criteria) this;
        }

        public Criteria andCreateByGreaterThanOrEqualTo(String value) {
            addCriterion("CREATE_BY >=", value, "createBy");
            return (Criteria) this;
        }

        public Criteria andCreateByLessThan(String value) {
            addCriterion("CREATE_BY <", value, "createBy");
            return (Criteria) this;
        }

        public Criteria andCreateByLessThanOrEqualTo(String value) {
            addCriterion("CREATE_BY <=", value, "createBy");
            return (Criteria) this;
        }

        public Criteria andCreateByLike(String value) {
            addCriterion("CREATE_BY like", value, "createBy");
            return (Criteria) this;
        }

        public Criteria andCreateByNotLike(String value) {
            addCriterion("CREATE_BY not like", value, "createBy");
            return (Criteria) this;
        }

        public Criteria andCreateByIn(List<String> values) {
            addCriterion("CREATE_BY in", values, "createBy");
            return (Criteria) this;
        }

        public Criteria andCreateByNotIn(List<String> values) {
            addCriterion("CREATE_BY not in", values, "createBy");
            return (Criteria) this;
        }

        public Criteria andCreateByBetween(String value1, String value2) {
            addCriterion("CREATE_BY between", value1, value2, "createBy");
            return (Criteria) this;
        }

        public Criteria andCreateByNotBetween(String value1, String value2) {
            addCriterion("CREATE_BY not between", value1, value2, "createBy");
            return (Criteria) this;
        }

        public Criteria andCreateDeptIsNull() {
            addCriterion("CREATE_DEPT is null");
            return (Criteria) this;
        }

        public Criteria andCreateDeptIsNotNull() {
            addCriterion("CREATE_DEPT is not null");
            return (Criteria) this;
        }

        public Criteria andCreateDeptEqualTo(String value) {
            addCriterion("CREATE_DEPT =", value, "createDept");
            return (Criteria) this;
        }

        public Criteria andCreateDeptNotEqualTo(String value) {
            addCriterion("CREATE_DEPT <>", value, "createDept");
            return (Criteria) this;
        }

        public Criteria andCreateDeptGreaterThan(String value) {
            addCriterion("CREATE_DEPT >", value, "createDept");
            return (Criteria) this;
        }

        public Criteria andCreateDeptGreaterThanOrEqualTo(String value) {
            addCriterion("CREATE_DEPT >=", value, "createDept");
            return (Criteria) this;
        }

        public Criteria andCreateDeptLessThan(String value) {
            addCriterion("CREATE_DEPT <", value, "createDept");
            return (Criteria) this;
        }

        public Criteria andCreateDeptLessThanOrEqualTo(String value) {
            addCriterion("CREATE_DEPT <=", value, "createDept");
            return (Criteria) this;
        }

        public Criteria andCreateDeptLike(String value) {
            addCriterion("CREATE_DEPT like", value, "createDept");
            return (Criteria) this;
        }

        public Criteria andCreateDeptNotLike(String value) {
            addCriterion("CREATE_DEPT not like", value, "createDept");
            return (Criteria) this;
        }

        public Criteria andCreateDeptIn(List<String> values) {
            addCriterion("CREATE_DEPT in", values, "createDept");
            return (Criteria) this;
        }

        public Criteria andCreateDeptNotIn(List<String> values) {
            addCriterion("CREATE_DEPT not in", values, "createDept");
            return (Criteria) this;
        }

        public Criteria andCreateDeptBetween(String value1, String value2) {
            addCriterion("CREATE_DEPT between", value1, value2, "createDept");
            return (Criteria) this;
        }

        public Criteria andCreateDeptNotBetween(String value1, String value2) {
            addCriterion("CREATE_DEPT not between", value1, value2, "createDept");
            return (Criteria) this;
        }

        public Criteria andCreateTimeIsNull() {
            addCriterion("CREATE_TIME is null");
            return (Criteria) this;
        }

        public Criteria andCreateTimeIsNotNull() {
            addCriterion("CREATE_TIME is not null");
            return (Criteria) this;
        }

        public Criteria andCreateTimeEqualTo(Date value) {
            addCriterion("CREATE_TIME =", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeNotEqualTo(Date value) {
            addCriterion("CREATE_TIME <>", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeGreaterThan(Date value) {
            addCriterion("CREATE_TIME >", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeGreaterThanOrEqualTo(Date value) {
            addCriterion("CREATE_TIME >=", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeLessThan(Date value) {
            addCriterion("CREATE_TIME <", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeLessThanOrEqualTo(Date value) {
            addCriterion("CREATE_TIME <=", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeIn(List<Date> values) {
            addCriterion("CREATE_TIME in", values, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeNotIn(List<Date> values) {
            addCriterion("CREATE_TIME not in", values, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeBetween(Date value1, Date value2) {
            addCriterion("CREATE_TIME between", value1, value2, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeNotBetween(Date value1, Date value2) {
            addCriterion("CREATE_TIME not between", value1, value2, "createTime");
            return (Criteria) this;
        }
    }

    /**
     * This class was generated by MyBatis Generator.
     * This class corresponds to the database table co_finance
     *
     * @mbg.generated do_not_delete_during_merge
     */
    public static class Criteria extends GeneratedCriteria implements Serializable {

        protected Criteria() {
            super();
        }
    }

    /**
     * This class was generated by MyBatis Generator.
     * This class corresponds to the database table co_finance
     *
     * @mbg.generated
     */
    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}