select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v5 * 0.5 + p.v8 * 0.5 as v1,
    coalesce(p.v7, 0) + 7 as v2,
    p.v5 + 11 as v3,
    case when p.v7 > 1300 then p.v7 else 0 end as v4,
    coalesce(p.v7, 0) + 3 as v5,
    p.v5 * 0.5 + p.v8 * 0.5 as v6
from {{ ref('int_ev_0000') }} as p
