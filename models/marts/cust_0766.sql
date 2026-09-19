select
    p.customer_id as customer_id,
    max(p.segment_id) as segment_id,
    median(p.v6) as s1,
    stddev_samp(p.v6) as s2,
    sum(p.v3) as s3,
    min(p.v6) as s4,
    sum(p.v6) as s5,
    stddev_samp(p.v6) as s6
from {{ ref('int_ev_0021') }} as p
group by p.customer_id
