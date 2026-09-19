select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    max(p.v4) as s1,
    avg(p.v6) as s2,
    avg(p.v6) as s3,
    min(p.v4) as s4,
    avg(p.v3) as s5
from {{ ref('int_ev_0411') }} as p
group by p.customer_id
