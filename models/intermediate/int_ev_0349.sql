select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v7 + p.v5 as v1,
    p.v7 - p.v5 as v2,
    p.v7 - p.v8 as v3,
    coalesce(p.v7, 0) + 11 as v4,
    coalesce(p.v8, 0) + 13 as v5,
    p.v7 + 3 as v6,
    p.v5 * 3 as v7,
    case when p.v7 > p.v5 then p.v7 else p.v5 end as v8
from {{ ref('int_ev_0222') }} as p
