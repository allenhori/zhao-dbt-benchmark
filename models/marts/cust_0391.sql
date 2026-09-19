select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    min(p.v1) as s1,
    max(p.v5) as s2,
    avg(p.v5) as s3,
    min(p.v5) as s4
from {{ ref('int_ev_0133') }} as p
group by p.customer_id
