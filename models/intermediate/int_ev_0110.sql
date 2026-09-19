select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v5 * 2 as v1,
    p.v5 * 7 as v2,
    p.v1 + 3 as v3,
    p.v5 * 13 as v4,
    p.v1 + 13 as v5,
    coalesce(p.v1, 0) + 2 as v6,
    case when p.v5 > p.v1 then p.v5 else p.v1 end as v7,
    coalesce(p.v5, 0) + 5 as v8
from {{ ref('int_ev_0025') }} as p
