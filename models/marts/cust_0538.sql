select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    max(p.v4) as s1,
    median(p.v4) as s2,
    median(p.v4) as s3,
    avg(p.v3) as s4,
    median(p.v3) as s5
from {{ ref('int_ev_0409') }} as p
group by p.customer_id
