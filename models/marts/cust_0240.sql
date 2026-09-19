select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    min(p.v3) as s1,
    avg(p.v3) as s2,
    min(p.v6) as s3,
    sum(p.v6) as s4,
    avg(p.v3) as s5,
    max(p.v6) as s6
from {{ ref('int_ev_0292') }} as p
group by p.customer_id
