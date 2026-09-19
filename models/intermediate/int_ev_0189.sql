select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    coalesce(p.v8, 0) + 13 as v1,
    coalesce(p.v7, 0) + 5 as v2,
    p.v6 + 5 as v3,
    p.v8 - p.v7 as v4,
    case when p.v6 > p.v7 then p.v6 else p.v7 end as v5,
    coalesce(p.v6, 0) + 3 as v6,
    p.v8 * 0.5 + p.v6 * 0.5 as v7
from {{ ref('int_ev_0153') }} as p
