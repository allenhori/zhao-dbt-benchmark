select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    case when p.v3 > 200 then p.v3 else 0 end as v1,
    coalesce(p.v5, 0) + 13 as v2,
    case when p.v5 > p.v3 then p.v5 else p.v3 end as v3,
    p.v5 + p.v3 as v4,
    p.v5 * 11 as v5,
    case when p.v5 > 700 then p.v5 else 0 end as v6,
    round(p.v3 / 13.0, 4) as v7
from {{ ref('int_ev_0021') }} as p
