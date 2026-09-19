select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    case when p.v4 > 1100 then p.v4 else 0 end as v1,
    case when p.v4 > 500 then p.v4 else 0 end as v2,
    p.v2 + 11 as v3,
    coalesce(p.v4, 0) + 11 as v4,
    p.v4 * 0.5 + p.v2 * 0.5 as v5,
    case when p.v2 > p.v4 then p.v2 else p.v4 end as v6
from {{ ref('int_ev_0220') }} as p
