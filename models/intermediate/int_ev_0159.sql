select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v5 * 7 as v1,
    p.v5 + 11 as v2,
    p.v5 * 3 as v3,
    case when p.v4 > 1300 then p.v4 else 0 end as v4,
    p.v4 + 2 as v5,
    p.v5 + p.v4 as v6,
    coalesce(p.v4, 0) + 7 as v7,
    p.v5 + 7 as v8
from {{ ref('int_ev_0021') }} as p
