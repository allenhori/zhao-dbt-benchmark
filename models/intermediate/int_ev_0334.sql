select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v5 * 7 as v1,
    coalesce(p.v4, 0) + 3 as v2,
    coalesce(p.v5, 0) + 13 as v3,
    p.v5 * 13 as v4,
    case when p.v5 > 1100 then p.v5 else 0 end as v5,
    round(p.v5 / 7.0, 4) as v6
from {{ ref('int_ev_0318') }} as p
