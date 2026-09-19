select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    max(p.v4) as s1,
    avg(p.v1) as s2,
    max(p.v2) as s3,
    avg(p.v4) as s4,
    avg(p.v1) as s5
from {{ ref('int_ev_0277') }} as p
group by p.customer_id
