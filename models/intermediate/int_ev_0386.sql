select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v2 + 3 as v1,
    case when p.v2 > 1300 then p.v2 else 0 end as v2,
    p.v6 + 2 as v3,
    p.v2 - p.v6 as v4,
    coalesce(p.v6, 0) + 11 as v5,
    round(p.v6 / 3.0, 4) as v6,
    coalesce(p.v6, 0) + 3 as v7,
    p.v2 * 7 as v8
from {{ ref('int_ev_0045') }} as p
