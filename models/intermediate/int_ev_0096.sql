select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    coalesce(p.v6, 0) + 3 as v1,
    case when p.v6 > p.v2 then p.v6 else p.v2 end as v2,
    p.v6 + 5 as v3,
    coalesce(p.v2, 0) + 13 as v4,
    p.v6 * 11 as v5,
    p.v2 + 11 as v6,
    round(p.v2 / 3.0, 4) as v7
from {{ ref('int_ev_0038') }} as p
