select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    sum(p.v3) as s1,
    sum(p.v3) as s2,
    avg(p.v6) as s3,
    max(p.v6) as s4,
    min(p.v6) as s5
from {{ ref('int_ev_0270') }} as p
group by p.customer_id
