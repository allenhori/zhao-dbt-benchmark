select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    max(p.v2) as s1,
    min(p.v6) as s2,
    max(p.v6) as s3,
    sum(p.v1) as s4,
    avg(p.v1) as s5
from {{ ref('int_ev_0091') }} as p
group by p.customer_id
