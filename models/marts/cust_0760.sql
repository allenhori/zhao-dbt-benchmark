select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    sum(p.v3) as s1,
    avg(p.v2) as s2,
    median(p.v6) as s3,
    sum(p.v6) as s4,
    min(p.v2) as s5
from {{ ref('int_ev_0426') }} as p
group by p.customer_id
