select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    round(p.v1 / 7.0, 4) as v1,
    coalesce(p.v3, 0) + 11 as v2,
    p.v4 * 11 as v3,
    case when p.v1 > 200 then p.v1 else 0 end as v4,
    case when p.v4 > 500 then p.v4 else 0 end as v5,
    case when p.v4 > 200 then p.v4 else 0 end as v6,
    case when p.v1 > 500 then p.v1 else 0 end as v7,
    p.v3 * 7 as v8
from {{ ref('int_ev_0021') }} as p
