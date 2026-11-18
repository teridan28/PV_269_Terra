version 1.0

workflow MujPrvniWorkflow {
    input {
        String jmeno = "Student"
    }

    call Pozdrav {
        input:
            cilove_jmeno = jmeno
    }

    output {
        File vysledny_soubor = Pozdrav.vystup
    }
}

task Pozdrav {
    input {
        String cilove_jmeno
    }

    command <<<
        echo "Ahoj, ~{cilove_jmeno}! Workflow v Terre funguje." > pozdrav.txt
    >>>

    output {
        File vystup = "pozdrav.txt"
    }

    runtime {
        docker: "ubuntu:latest"
    }
}