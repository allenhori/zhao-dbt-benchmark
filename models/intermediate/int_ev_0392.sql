select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v7 * 0.5 + p.v3 * 0.5 as v1,
    case when p.v3 > 1100 then p.v3 else 0 end as v2,
    case when p.v3 > p.v6 then p.v3 else p.v6 end as v3,
    case when p.v3 > 1300 then p.v3 else 0 end as v4,
    p.v7 * 11 as v5,
    p.v3 - p.v7 as v6,
    case when p.v3 > 1100 then p.v3 else 0 end as v7
from {{ ref('int_ev_0164') }} as p
