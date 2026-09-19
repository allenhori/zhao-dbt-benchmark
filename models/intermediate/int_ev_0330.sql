select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    case when p.v1 > 700 then p.v1 else 0 end as v1,
    p.v1 * 2 as v2,
    round(p.v1 / 13.0, 4) as v3,
    coalesce(p.v1, 0) + 11 as v4,
    case when p.v1 > p.v2 then p.v1 else p.v2 end as v5,
    p.v1 + 3 as v6,
    p.v5 + p.v1 as v7
from {{ ref('int_ev_0204') }} as p
