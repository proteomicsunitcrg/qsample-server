package eu.crg.qsample.qgenerator.application;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
@Entity
@Table(name = "application_constraint")
public class ApplicationConstraint {

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.AUTO, generator = "application_constraint_seq")
    @SequenceGenerator(name = "application_constraint_seq", sequenceName = "application_constraint_seq", allocationSize = 1)
    private Long id;

    @Column()
    @NotNull
    private String name;

    @Column()
    @NotNull
    private boolean showQuantificationHeatMap;

    @Column()
    @NotNull
    private boolean showQuantificationAndContaminantList;

    @Column()
    @NotNull
    private boolean showIdentifiedProteinsPlot;

    @Column()
    @NotNull
    private boolean showIdentifiedPeptidesPlot;

    @Column()
    @NotNull
    private boolean showFileInfoPlot;

    @Column()
    @NotNull
    private boolean showModificationsPlot;

    @Column(columnDefinition = "bit(1) default false")
    @NotNull
    private boolean showDendogram;

    @Column(columnDefinition = "bit(1) default false")
    @NotNull
    private boolean showChargesPlot;

    public Long getId() {
        return id;
    }


    public void setId(Long id) {
        this.id = id;
    }

    public boolean isShowQuantificationHeatMap() {
        return showQuantificationHeatMap;
    }

    public ApplicationConstraint() {
    }



    public ApplicationConstraint(Long id, @NotNull String name, @NotNull boolean showQuantificationHeatMap,
            @NotNull boolean showQuantificationAndContaminantList, @NotNull boolean showIdentifiedProteinsPlot,
            @NotNull boolean showIdentifiedPeptidesPlot, @NotNull boolean showFileInfoPlot,
            @NotNull boolean showModificationsPlot) {
        this.id = id;
        this.name = name;
        this.showQuantificationHeatMap = showQuantificationHeatMap;
        this.showQuantificationAndContaminantList = showQuantificationAndContaminantList;
        this.showIdentifiedProteinsPlot = showIdentifiedProteinsPlot;
        this.showIdentifiedPeptidesPlot = showIdentifiedPeptidesPlot;
        this.showFileInfoPlot = showFileInfoPlot;
        this.showModificationsPlot = showModificationsPlot;
    }


    public void setShowQuantificationHeatMap(boolean showQuantificationHeatMap) {
        this.showQuantificationHeatMap = showQuantificationHeatMap;
    }

    public boolean isShowQuantificationAndContaminantList() {
        return showQuantificationAndContaminantList;
    }

    public void setShowQuantificationAndContaminantList(boolean showQuantificationAndContaminantList) {
        this.showQuantificationAndContaminantList = showQuantificationAndContaminantList;
    }

    public boolean isShowIdentifiedProteinsPlot() {
        return showIdentifiedProteinsPlot;
    }

    public void setShowIdentifiedProteinsPlot(boolean showIdentifiedProteinsPlot) {
        this.showIdentifiedProteinsPlot = showIdentifiedProteinsPlot;
    }

    public boolean isShowIdentifiedPeptidesPlot() {
        return showIdentifiedPeptidesPlot;
    }

    public void setShowIdentifiedPeptidesPlot(boolean showIdentifiedPeptidesPlot) {
        this.showIdentifiedPeptidesPlot = showIdentifiedPeptidesPlot;
    }

    public boolean isShowFileInfoPlot() {
        return showFileInfoPlot;
    }

    public void setShowFileInfoPlot(boolean showFileInfoPlot) {
        this.showFileInfoPlot = showFileInfoPlot;
    }

    public boolean isShowModificationsPlot() {
        return showModificationsPlot;
    }

    public void setShowModificationsPlot(boolean showModificationsPlot) {
        this.showModificationsPlot = showModificationsPlot;
    }


    public String getName() {
        return name;
    }


    public void setName(String name) {
        this.name = name;
    }


    public boolean isShowDendogram() {
        return showDendogram;
    }


    public void setShowDendogram(boolean showDendogram) {
        this.showDendogram = showDendogram;
    }


    public ApplicationConstraint(Long id, @NotNull String name, @NotNull boolean showQuantificationHeatMap,
            @NotNull boolean showQuantificationAndContaminantList, @NotNull boolean showIdentifiedProteinsPlot,
            @NotNull boolean showIdentifiedPeptidesPlot, @NotNull boolean showFileInfoPlot,
            @NotNull boolean showModificationsPlot, @NotNull boolean showDendogram) {
        this.id = id;
        this.name = name;
        this.showQuantificationHeatMap = showQuantificationHeatMap;
        this.showQuantificationAndContaminantList = showQuantificationAndContaminantList;
        this.showIdentifiedProteinsPlot = showIdentifiedProteinsPlot;
        this.showIdentifiedPeptidesPlot = showIdentifiedPeptidesPlot;
        this.showFileInfoPlot = showFileInfoPlot;
        this.showModificationsPlot = showModificationsPlot;
        this.showDendogram = showDendogram;
    }


    public boolean isShowChargesPlot() {
        return showChargesPlot;
    }


    public void setShowChargesPlot(boolean showChargesPlot) {
        this.showChargesPlot = showChargesPlot;
    }


    public ApplicationConstraint(Long id, @NotNull String name, @NotNull boolean showQuantificationHeatMap,
            @NotNull boolean showQuantificationAndContaminantList, @NotNull boolean showIdentifiedProteinsPlot,
            @NotNull boolean showIdentifiedPeptidesPlot, @NotNull boolean showFileInfoPlot,
            @NotNull boolean showModificationsPlot, @NotNull boolean showDendogram, @NotNull boolean showChargesPlot) {
        this.id = id;
        this.name = name;
        this.showQuantificationHeatMap = showQuantificationHeatMap;
        this.showQuantificationAndContaminantList = showQuantificationAndContaminantList;
        this.showIdentifiedProteinsPlot = showIdentifiedProteinsPlot;
        this.showIdentifiedPeptidesPlot = showIdentifiedPeptidesPlot;
        this.showFileInfoPlot = showFileInfoPlot;
        this.showModificationsPlot = showModificationsPlot;
        this.showDendogram = showDendogram;
        this.showChargesPlot = showChargesPlot;
    }




}
