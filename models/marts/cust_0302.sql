select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    min(p.v5) as s1,
    min(p.v4) as s2,
    sum(p.v5) as s3,
    sum(p.v6) as s4
from {{ ref('int_ev_0352') }} as p
group by p.customer_id
