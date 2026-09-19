select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v6 + 5 as v1,
    p.v6 + 2 as v2,
    case when p.v6 > p.v1 then p.v6 else p.v1 end as v3,
    case when p.v6 > 1300 then p.v6 else 0 end as v4,
    p.v1 * 0.5 + p.v6 * 0.5 as v5,
    p.v1 * 11 as v6,
    p.v6 + 3 as v7,
    p.v1 * 0.5 + p.v6 * 0.5 as v8
from {{ ref('int_ev_0226') }} as p
