select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    min(p.v4) as s1,
    sum(p.v1) as s2,
    sum(p.v4) as s3,
    max(p.v1) as s4
from {{ ref('int_ev_0413') }} as p
group by p.customer_id
