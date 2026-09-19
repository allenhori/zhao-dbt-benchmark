select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v8 + 5 as v1,
    case when p.v2 > 200 then p.v2 else 0 end as v2,
    p.v2 + 2 as v3,
    case when p.v7 > p.v8 then p.v7 else p.v8 end as v4,
    p.v2 + 2 as v5,
    p.v2 * 0.5 + p.v8 * 0.5 as v6
from {{ ref('int_ev_0033') }} as p
