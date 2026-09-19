select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    avg(p.v7) as s1,
    max(p.v1) as s2,
    min(p.v2) as s3,
    min(p.v1) as s4
from {{ ref('int_ev_0435') }} as p
group by p.customer_id
