package eu.crg.qsample.TraceColor;

import java.util.UUID;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import org.hibernate.annotations.Type;
@Entity
@Table(name = "traceColor")
public class TraceColor {

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.AUTO, generator = "traceColor_seq")
    @SequenceGenerator(name = "traceColor_seq", sequenceName = "traceColor_seq", allocationSize = 1)
    private Long id;

    @Column(name = "apiKey", length = 50)
    @NotNull
    @Type(type = "uuid-char")
    private UUID apiKey;

    @Column(name = "r", length = 50)
    @NotNull
    private Long r;

    @Column(name = "g", length = 50)
    @NotNull
    private Long g;

    @Column(name = "b", length = 50)
    @NotNull
    private Long b;

    @Column(name = "a", length = 50)
    @NotNull
    private Long a;

}
