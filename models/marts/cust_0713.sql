select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    sum(p.v3) as s1,
    min(p.v3) as s2,
    sum(p.v4) as s3,
    sum(p.v4) as s4,
    sum(p.v3) as s5
from {{ ref('int_ev_0255') }} as p
group by p.customer_id
