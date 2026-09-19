select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    sum(p.v6) as s1,
    median(p.v7) as s2,
    max(p.v6) as s3,
    min(p.v6) as s4,
    max(p.v6) as s5
from {{ ref('int_ev_0245') }} as p
group by p.customer_id
