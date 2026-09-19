select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    min(p.v5) as s1,
    median(p.v6) as s2,
    avg(p.v5) as s3,
    max(p.v6) as s4
from {{ ref('int_ev_0277') }} as p
group by p.customer_id
