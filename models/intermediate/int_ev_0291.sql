select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v4 + p.v8 as v1,
    case when p.v8 > 1300 then p.v8 else 0 end as v2,
    case when p.v8 > p.v4 then p.v8 else p.v4 end as v3,
    p.v4 + p.v8 as v4,
    p.v8 * 5 as v5,
    p.v4 + p.v8 as v6,
    p.v4 + 5 as v7,
    p.v4 + 2 as v8
from {{ ref('int_ev_0153') }} as p
