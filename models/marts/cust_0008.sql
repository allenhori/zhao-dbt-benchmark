select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    avg(p.v6) as s1,
    median(p.v6) as s2,
    min(p.v7) as s3,
    avg(p.v2) as s4
from {{ ref('int_ev_0104') }} as p
group by p.customer_id
