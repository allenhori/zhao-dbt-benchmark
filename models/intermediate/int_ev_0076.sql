select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    coalesce(p.v8, 0) + 13 as v1,
    case when p.v2 > 1300 then p.v2 else 0 end as v2,
    p.v1 * 7 as v3,
    p.v2 * 0.5 + p.v1 * 0.5 as v4,
    coalesce(p.v1, 0) + 7 as v5,
    p.v8 * 5 as v6,
    p.v1 + p.v8 as v7,
    p.v2 + 13 as v8
from {{ ref('int_ev_0049') }} as p
