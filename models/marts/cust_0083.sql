select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    min(p.v5) as s1,
    min(p.v2) as s2,
    avg(p.v2) as s3,
    sum(p.v5) as s4
from {{ ref('int_ev_0331') }} as p
group by p.customer_id
