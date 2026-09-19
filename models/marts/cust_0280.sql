select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    max(p.v6) as s1,
    sum(p.v6) as s2,
    min(p.v4) as s3,
    max(p.v6) as s4
from {{ ref('int_ev_0061') }} as p
group by p.customer_id
