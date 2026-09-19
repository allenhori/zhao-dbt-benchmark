select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    sum(p.v5) as s1,
    median(p.v2) as s2,
    median(p.v2) as s3,
    avg(p.v6) as s4,
    sum(p.v6) as s5,
    max(p.v6) as s6
from {{ ref('int_ev_0292') }} as p
group by p.customer_id
