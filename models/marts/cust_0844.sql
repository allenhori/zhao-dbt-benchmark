select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    median(p.v3) as s1,
    min(p.v6) as s2,
    avg(p.v3) as s3,
    sum(p.v6) as s4
from {{ ref('int_ev_0261') }} as p
group by p.customer_id
