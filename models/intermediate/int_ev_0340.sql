select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    coalesce(p.v6, 0) + 13 as v1,
    p.v7 + p.v6 as v2,
    p.v6 * 0.5 + p.v7 * 0.5 as v3,
    case when p.v6 > p.v7 then p.v6 else p.v7 end as v4,
    p.v6 + 5 as v5,
    coalesce(p.v6, 0) + 2 as v6,
    case when p.v6 > p.v7 then p.v6 else p.v7 end as v7
from {{ ref('int_ev_0025') }} as p
