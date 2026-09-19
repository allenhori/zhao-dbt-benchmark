select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    case when p.v7 > p.v6 then p.v7 else p.v6 end as v1,
    p.v6 + p.v7 as v2,
    case when p.v2 > 300 then p.v2 else 0 end as v3,
    p.v6 * 7 as v4,
    p.v7 + 11 as v5,
    coalesce(p.v7, 0) + 7 as v6,
    case when p.v7 > p.v6 then p.v7 else p.v6 end as v7
from {{ ref('int_ev_0161') }} as p
