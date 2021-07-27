import com.alibaba.excel.EasyExcel;
import com.alibaba.excel.annotation.ExcelProperty;
import lombok.Data;
import org.junit.Test;

import java.util.ArrayList;
import java.util.List;

@Data
public class EasyExcelTest {
    @ExcelProperty("学生编号")
    private Integer sno;
    @ExcelProperty("学生姓名")
    private String sname;

    @Test
    public void testMethod(){
        EasyExcel.write("C:\\Users\\June\\Desktop\\新建 Microsoft Excel 工作表.xlsx",EasyExcelTest.class)
                .sheet("学生列表")
                .doWrite(getData());
    }
    private static List<EasyExcelTest> getData(){
        List<EasyExcelTest> list = new ArrayList<>();
        for (int i = 0; i < 10000; i++) {
            EasyExcelTest e = new EasyExcelTest();
            e.setSno(i);
            e.setSname("lucy"+i);
            list.add(e);
        }

        return list;
    }

    @Test
    public void testRead(){
        EasyExcel.read("C:\\Users\\June\\Desktop\\新建 Microsoft Excel 工作表.xlsx",EasyExcelTest.class,new ExcelListener()).sheet().doRead();
    }
}
